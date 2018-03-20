module LinksHelper
    def embed(youtube_url)
        youtube_id = youtube_url.split("=").last
        content_tag(:iframe, nil,width: 480 , height: 360 , src: "//www.youtube.com/embed/#{youtube_id}")
    end
    
    def thumbnail(youtube_url)
        youtube_id = youtube_url.split("=").last
        
        image_tag("https://img.youtube.com/vi/#{youtube_id}/hqdefault.jpg" , size: "250x200")
    end 
    
    def name(youtube_url)
        video = VideoInfo.new(youtube_url)
        video.title.truncate(35)
        
        
    end    
end
