module HomeHelper
  def tweeter_accounts(tw_accounts)
    if tw_accounts.empty?
      " - "
    else
      tw_accounts = tw_accounts.map{ |ta| "<a href=\"http://twitter.com/@#{ta.username}\" target=\"_blank\">#{ta.username}</a>" }
      ([tw_accounts.first(tw_accounts.size - 1).join(", "), tw_accounts.last(1)] - [""]).join(" and ")
    end
  end
end