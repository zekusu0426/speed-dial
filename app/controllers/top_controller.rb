class TopController < ApplicationController
  def index
    @bookmarks = current_user.try!(:bookmarks)
    # @bookmark_new = current_user.try!(:bookmarks).try!(:new)
  end
end
