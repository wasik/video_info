require 'iso8601'

class VideoInfo
  module Providers
    class Hudl < Provider
      def self.usable?(url)
        url =~ %r{(hudl\.com\/(video).*)}x
      end

      def provider
        'Hudl'
      end

      %w[width height].each do |method|
        define_method(method) { nil }
      end

      def embed_url
        "//www.hudl.com/embed/video/#{video_id}"
      end

      def thumbnail_small
        #"https://i.ytimg.com/vi/#{video_id}/default.jpg"
        #"/assets/video_thumb.jpg"
        return nil
      end

      def thumbnail_medium
        #"https://i.ytimg.com/vi/#{video_id}/mqdefault.jpg"
        #"/assets/video_thumb.jpg"
        return nil
      end

      def thumbnail_large
        #"https://i.ytimg.com/vi/#{video_id}/hqdefault.jpg"
        #"/assets/video_thumb.jpg"
        return nil
      end

      def thumbnail_maxres
        #"https://i.ytimg.com/vi/#{video_id}/maxresdefault.jpg"
        #"/assets/video_thumb.jpg"
        return nil
      end

      private

      def _url_regex
        #%r{(?:youtube(?:-nocookie)?\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|
        #   .*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})}x
        #%r{embed/video\/([a-zA-Z0-9\/]+)}x

        #%r{(?:vkontakte\.ru\/video|vk\.com\/video
        #            |vk\.com\/.*?video)(-?\d+_\d+)}i

        #%r{(?:hudl\.com\/video|v)\/([a-zA-Z0-9]+)}x
        %r{(?:hudl\.com\/video)\/(.+)}x
      end

      def _default_iframe_attributes
        { allowfullscreen: 'allowfullscreen' }
      end

      def _default_url_attributes
        {}
      end
    end
  end
end
