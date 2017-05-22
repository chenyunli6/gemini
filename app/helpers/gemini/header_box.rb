module Gemini
  module HeaderBox
    DEFAULT_APP_HEADER_OPTIONS = {
      logo_url: 'default_logo.png',
      titles: ['【应用名字】'], #mabey title have sub titles
      avatar_img_url: 'default_avatar.png',
      nickname: '【用户昵称或邮箱】',
      avatar_redirect_to: 'https://jinshuju.net' #click nickname will link to jinshuju
    }

    def header_box header_options = {}
      header_options.delete_if { |key, value| value.blank? }
      options = DEFAULT_APP_HEADER_OPTIONS.merge header_options
      content_tag :nav, class: 'navbar navbar-default navbar-static-top topnav-color', id: 'header_box' do
        content_tag :div, class: 'container' do
          content_tag :div, class: 'app-header col-md-10 col-md-offset-1' do
            app_info_dom = app_info_container(options)
            avatar_info_dom = avatar_info_container(options)
            "#{app_info_dom}#{avatar_info_dom}".html_safe
          end
        end
      end
    end

    private

    def avatar_info_container(options)
      content_tag :ul, class: 'app-avatar-container nav navbar-nav navbar-right' do
        content_tag :li do
          link_to options[:avatar_redirect_to] do
            content_tag :div, class: 'nav-right' do
              "#{image_tag(options[:avatar_img_url], class: 'avatar')}#{options[:nickname]}".html_safe
            end.html_safe
          end.html_safe
        end.html_safe
      end
    end

    def app_info_container options
      content_tag :div, class: 'app-info-container navbar-header' do
        content_tag :div, class: 'nav-left' do
          logo = link_to image_tag(options[:logo_url], class: 'app-logo'), '/', class: 'navbar-brand'
          title = link_to '/', class: 'app-title-container' do
            titles = options[:titles].select(&:present?)
            titles.map.with_index do |title, index|
              next if title.blank?
              content_tag :span, class: "title-text #{'title-active' if index > 0 || titles.size <= 1}" do
                title
              end
            end.compact.join(' / ').html_safe
          end
          "#{logo}#{title}".html_safe
        end.html_safe
      end
    end
  end
end
