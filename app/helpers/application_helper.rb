module ApplicationHelper
  # <p class="alert alert-success"><%= flash[:success] if flash[:success] %></p>
  # <p class="alert alert-info"><%= flash[:info] if flash[:info] %></p>
  # <p class="alert alert-warning"><%= flash[:warning]if flash[:warning] %></p>
  # <p class="alert alert-danger"><%= flash[:danger] if flash[:danger] %></p>
  # <p class="alert notice"><%= notice %></p>
  # <p class="alert alert"><%= alert %></p>

  def flash_message
    (create_flash_message(:danger) || create_flash_message(:warning) ||
     create_flash_message(:info) || create_flash_message(:success) ||
     create_flash_message(:alert)|| create_flash_message(:notice))
  end

  private

  def create_flash_message(type)
    if flash[type]
      content_tag :p, class: "alert alert-#{type}" do
        flash[type]
      end
    end
  end
end
