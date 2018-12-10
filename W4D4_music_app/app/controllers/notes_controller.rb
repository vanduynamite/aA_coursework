# edit_note GET    /notes/:id/edit(.:format)  notes#edit
# note      PATCH  /notes/:id(.:format)       notes#update
# note      DELETE /notes/:id(.:format)       notes#destroy


class NotesController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner

  def edit

  end

  def update

  end

  def destroy

  end

end
