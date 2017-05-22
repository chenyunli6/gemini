module Gemini
  module AppPublishLink
    def app_publish_link link
      content_tag :div, class: 'app-publish-link-container' do
        concat(text_field_tag(nil, link, id: 'publish-link-url', readonly: true, class: 'gd-input-large'))
        concat(link_to '复制网址', JS_VOID, class: 'gd-btn gd-btn-info', id: 'copy-publish-link', data: {'clipboard-target' => '#publish-link-url'})
        concat(link_to '直接打开', link, target: '_blank', class: 'gd-btn gd-btn-info')
      end
    end
  end
end
