defmodule ColBrowsBackend.WebpageController do
  use ColBrowsBackend.Web, :controller

  def show(conn, %{"id" => id}) do
    page = %{
        viewers: [%{
            viewer_id: 1,
            scroll_position: 0,
            mouse_position: %{
                x: 0,
                y: 0,
            }
        }, %{
            viewer_id: 2,
            scroll_position: 10,
            mouse_position: %{
                x: 15,
                y: 20,
            }
        }, %{
            viewer_id: 3,
            scroll_position: 300,
            mouse_position: %{
                x: 350,
                y: 80,
            }
        }]
    }

    render conn, "show.json", page: page
  end
end