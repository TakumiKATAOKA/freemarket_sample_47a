crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end


crumb :item do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
