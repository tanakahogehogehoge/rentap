module MypsHelper
  def user_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_myps_path
    elsif action_name == 'edit'
      myp_path
    end
  end
end
