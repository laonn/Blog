# _plugins/auto_abs_image.rb
# Markdown 내용 안의 이미지 경로를 자동으로 절대 URL로 변환

module Jekyll
  class AbsoluteImageUrlGenerator < Jekyll::Generator
    safe true
    priority :low

    ABSOLUTE_PREFIX = "https://image.laon.blog"

    def generate(site)
      site.posts.docs.each do |post|
        # Markdown content 안의 ![alt](/경로) 형태를 찾아서 변환
        post.content.gsub!(/!\[(.*?)\]\((\/[^\)]+)\)/) do |match|
          alt_text = Regexp.last_match(1)
          img_path = Regexp.last_match(2)
          "![#{alt_text}](#{ABSOLUTE_PREFIX}#{img_path})"
        end
      end
    end
  end
end
