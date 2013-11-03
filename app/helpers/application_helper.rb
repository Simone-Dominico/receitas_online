module ApplicationHelper
        def full_title(title)
                base_title = "Receitas Online"
                
                return base_title if title.empty?

                "#{base_title} | #{title}"
        end
end