module GitStat
  def is_regex_empty?(regex_match)
    return scan(/#{regex_match}/).empty?
  end
  def get_first_git_revision(branch)
    # requires git 1.7.4.2+ http://stackoverflow.com/questions/1006775/how-to-reference-the-initial-commit
    %x( git rev-list --max-parents=0 #{branch} )
  end

  def get_latest_git_revision(branch)
    %x( git rev-parse #{branch} )
  end
end
