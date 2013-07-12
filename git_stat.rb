module GitStat
  def is_regex_empty?(regex_match)
    return self.scan(/#{regex_match}/).empty?
  end
end
