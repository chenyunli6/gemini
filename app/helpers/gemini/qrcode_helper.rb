module Gemini
  module Qrcode
    QRCODE_SIZE_MAP = {
      256 => 'small#小号#你的文件',
      512 => 'medium#中号#插入到PPT中',
      1024 => 'large#大号#海报印刷'
    }.freeze

    def qrcode_preview origin
      qrcode = RQRCode::QRCode.new origin
      content_tag :div, class: 'qrcode-component qrcode clearfix' do
        image = content_tag :div, class: 'qrcode-container pull-left' do
          image_tag generate_qrcode qrcode, 200
        end
        description_text = content_tag :div, class: 'items standard-container pull-left' do
          QRCODE_SIZE_MAP.map do |size, info_string|
            en_name, ch_name, purpose = info_string.split('#')
            content_tag :div, class: 'link-item' do
              href = generate_qrcode qrcode, size
              link = link_to ch_name, href, target: '_blank', download: "qrcode-#{en_name}.png"
              desc_text = content_tag :div, "宽度#{size}px，适合#{purpose}"
              (link + desc_text).html_safe
            end
          end.join.html_safe
        end
        image + description_text
      end
    end

    private

    def generate_qrcode qrcode, size
      "data:image/png;base64,#{Base64.encode64(qrcode.as_png(size: size).to_s)}"
    end
  end
end
