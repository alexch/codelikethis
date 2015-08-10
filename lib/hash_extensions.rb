class Hash
  def grab *keys
    keys = keys.map(&:to_sym)
    with_indifferent_access.select { |key, value| keys.include?(key.to_sym) }
  end

  alias + merge

  alias << merge!

end
