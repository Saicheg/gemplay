module ApplicationHelper
  def app_description
    "Fill in your gem starting with the last letter of the previous word. The last wins 50% discount and #{link_to('most performing', leaderboard_path, target: '_blank')} wins a free ticket to RubyConfBy!"
  end
end
