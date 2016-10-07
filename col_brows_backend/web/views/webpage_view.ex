defmodule ColBrowsBackend.WebpageView do
  use ColBrowsBackend.Web, :view

  def render("show.json", %{viewers: viewers}) do
    %{viewers: viewers}
  end

  def render("show.json", %{viewer: viewer}) do
    %{
        viewer_id: viewer.viewer_id,
        scroll_position: viewer.scroll_position,
        mouse_position: %{
            x: viewer.mouse_position.x,
            y: viewer.mouse_position.y,
        }
    }
  end
end