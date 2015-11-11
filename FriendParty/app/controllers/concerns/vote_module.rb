module VoteModule
  extend ActiveSupport::Concern

  #vote
  def upvotes
    @activity = Activity.find(params[:id])
    if !current_user.voted_up_for? @activity
      current_user.upvotes @activity
      current_user.save
    end
  end

  def downvotes
    @activity = Activity.find(params[:id])
    if current_user.voted_up_for? @activity
      current_user.downvotes @activity
      current_user.save
    end
  end

  private 

  def generate_chart(voteable,total_count)
      up_count = voteable.get_upvotes.size
      down_count = voteable.get_downvotes.size

      up_rate = up_count / total_count.to_f * 100
      down_rate = down_count / total_count.to_f * 100
      rest_rate = (total_count - up_count - down_count) / total_count.to_f * 100


      @chart = LazyHighCharts::HighChart.new('pie') do |f|
        f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
        series = {
                 :type=> 'pie',
                 :name=> 'vote statistics',
                 :data=> [
                    ['downvote',       down_rate],
                    {
                       :name=> 'upvote',    
                       :y=> up_rate,
                       :sliced=> true,
                       :selected=> true
                    },
                    ['Others',   rest_rate]
                 ]
        }
        f.series(series)
        f.options[:title][:text] = "THA PIE"
        f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
        f.plot_options(:pie=>{
          :allowPointSelect=>true, 
          :cursor=>"pointer" , 
          :dataLabels=>{
            :enabled=>true,
            :color=>"black",
            :style=>{
              :font=>"13px Trebuchet MS, Verdana, sans-serif"
            }
          }
        })
    end 

  end


end
