# The Twelve Factors

* created by Heroku
* rules for developing and deploying software as a service
* best practices and "don'ts"

https://12factor.net/
https://github.com/heroku/12factor

(diagrams in this lesson are from <https://12factor.net/>, License: MIT)

# Goals

* Use **declarative** formats for setup automation, to minimize time and cost for new developers joining the project;
* Have a **clean contract** with the underlying operating system, offering maximum portability between execution environments;
* Are suitable for **deployment** on modern **cloud** platforms, obviating the need for servers and systems administration;
* **Minimize divergence** between development and production, enabling continuous deployment for maximum agility;
* And can **scale up** without significant changes to tooling, architecture, or development practices.

# Factor I. Codebase
One codebase tracked in revision control, many deploys

* Many codebases -> possibility for divergence and dis-integration

* Share code through libraries via the dependency manager

> "If there are multiple codebases, it's not an app -- it's a distributed system."

# Factor II. Dependencies
Explicitly declare and isolate dependencies

* Declare all packages in a manifest file

* Never depend on system-wide packages or tools (even `curl` or `sh`) unless explicitly delared and included in build process

* Use a dependency isolation tool during development and deployment to ensure no packages leak in

For example:

* Ruby: bundler
* JavaScript: npm Node Package Manager
* Python: pip / virtualenv

# Factor III. Config
Store config in the environment

* *config* is everything that is likely to vary between environments (staging, production, development, sandbox, QA, etc).
  * database connection details
  * credentials for internal and external services (e.g. AWS) 
  * server host name

* config is external to the code base

> A litmus test for whether an app has all config correctly factored out of the code is whether the codebase could be made open source at any moment, without compromising any credentials.
 
* config *files* are a good idea but are not 12F-compliant, since it's too easy to check them in to source control, and there are too many conventions on format and location
* *environment variables* are easy to change between deploys without changing any code, and easy to read from any language

# Factor IV. Backing services
Treat backing services as attached resources

* any service the app connects to over the network should be accessed through config strings 
  * e.g. database URLs
* make no distinction between internal and external resources
  * e.g. remote AWS vs internal SMTP
* no hardcoded config strings in source code; see Factor III

![attached resources](attached-resources.png)


# Factor V. Build, release, run
Strictly separate build and run stages

* a *build* is an artifact of the app's build process; each build is based on a given version of the codebase
  * in Git, "given version" means a commit hash or tag
  * each build should also get a version number that is unique to that build, e.g. a timestamp or serial number or [SemVer](https://semver.org/) bump
* the build stage gathers source code, compiles it (if needed), runs automated tests (if possible), gathers dependencies and assets, and produces a build
* the release stage combines a build with a config and deploys the build to various hosts
* the run stage launches the app via running (or restarting) 1 or more processes in the correct environment(s) with the correct config

> **Never** edit code in production! 


# Factor VI. Processes
Execute the app as one or more stateless processes

* A *process* is managed by the OS; in Unix these are lightweight and easy to control with system tools
  * A single script is a single process
  * Servers often spawn multiple processes but can be controlled via a master process
* Twelve-factor processes are stateless and [share nothing](https://en.wikipedia.org/wiki/Shared-nothing_architecture)
* Store any persistent data in a service, e.g. a database or memcache
* Use the host's memory and disk for transient state only, assuming it will or may disappear after the current client request
* Remember that a process may be killed at any time
  * or migrated to a different host

# Factor VII. Port binding
Export services via port binding

This rule is a bit esoteric, referring to running an app server *inside* an app container like Tomcat (Java) or Apache (PHP)

App containers provide features like caching and error handling that are outside the scope of the app itself; those features may impede development and testing so should be separate from the app

An app should run the desired protocol on a port (e.g. http://localhost:5000 ) and the container should *proxy* to that port

# Factor VIII. Concurrency
Scale out via the process model

 * Unix processes are lightweight and reliable
 * Unix has well-defined process [termination signals](https://www.gnu.org/software/libc/manual/html_node/Termination-Signals.html) (esp. [SIGTERM and SIGKILL](https://www.quora.com/What-is-the-difference-between-the-SIGINT-and-SIGTERM-signals-in-Linux-What%E2%80%99s-the-difference-between-the-SIGKILL-and-SIGSTOP-signals))
 * Stateless processes are scalable on one or more hosts

![process types](process-types.png)

> If you want more workers, launch more workers

# Factor IX. Disposability
Maximize robustness with fast startup and graceful shutdown

* The twelve-factor app’s processes are disposable, meaning they can be started or stopped at a moment’s notice
  * fast scaling up or down
  * rapid deployment of code or config changes
* Processes should 
  * minimize startup time
  * shut down *gracefully* when they receive a SIGTERM signal
  * be [robust](https://en.wikipedia.org/wiki/Idempotence) against [sudden death](https://lwn.net/Articles/191059/)

# Factor X. Dev/prod parity
Keep development, staging, and production as similar as possible

> There may be social, cultural, workflow, or policy pressures to break this rule!

People in different roles work on the same app, so their priorities are different. By keeping the environments as similar as possible, you reduce the chance that the needs of one group will make things harder for another.

DevOps is about bringing those people together, either literally or in spirit.

# Factor X. Dev/prod parity (cont.)
Keep development, staging, and production as similar as possible

> "Differences between backing services mean that tiny incompatibilities crop up, causing code that worked and passed tests in development or staging to fail in production." 


* When developers run the same OS / DB / etc. while building the code, they will encounter and fix errors before the code gets deployed
* Devs run local services natively, or via Docker and Vagrant
* Devs run *personal* installations of remote services via Chef / Puppet / Ansible
* Devs use *environment config* to point to their own services; the code doesn't know or care where it's running 
* Ops experts develop tools for automated spin-up of new instances of services, instead of tweaking and expanding a single org-wide instance of that service


# Factor XI. Logs
Treat logs as event streams

Logs are commonly written to files, but this technique does not scale
  * disks fill up, requiring log rotation and compression and storage, features which are not essential to your app but which you must handle
  * if there's a single log file, apps running on multiple processes must compete for it
  * if there are multiple log files, it's hard to synchronize them and follow along
   
A 12-factor app just outputs its logs to the standard output stream, `stdout`.

* in development, stdout is usually immediately visible
* in production, the execution environment captures logs from all processes / hosts, collates them, and sends them to a logging service (like Splunk) for viewing and archival (and expiration) and monitoring
* separate responsibility: outputting a single log event vs. processing many log events


# Factor XII. Admin processes
Run admin/management tasks as one-off processes

* one-off administrative or maintenance tasks for the app should be *scripted*
  * database migrations for schema changes and data grooming
  * console for runtime inspection and debugging
* these scripts must be *developed* and *version controlled* and *tested* before running them live
  * this is possible due to dev/prod parity
 
