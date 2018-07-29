# MongoDB

Let's analyze the source code of the TIL app to understand the steps involved in using MongoDB from NodeJS.

# Connect

Connect to MongoDB with a URI:
  
    const url = process.env.MONGODB_URI || 'mongodb://localhost:27017';

> if there's a shell environment variable named MONGODB_URI, use it; otherwise, connect to localhost

# Read the Command Line Parameters


