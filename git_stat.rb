module GitStat
  def is_regex_empty?(regex_match)
    return scan(/#{regex_match}/).empty?
  end
end
