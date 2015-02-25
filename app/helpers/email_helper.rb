module EmailHelper
  def email_panel
    content_tag :table, class: 'row callout' do
      content_tag :tr do
        content_tag :td, class: 'wrapper last' do
          content_tag :table, class: 'twelve columns' do
            content_tag :tr do
              content_tag :td, class: 'panel' do
                yield
              end
            end
          end
        end
      end
    end
  end
end
