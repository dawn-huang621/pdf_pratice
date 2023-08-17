class ComponentsController < ApplicationController
    
  def component1
    @resume = Resume.find(params[:resume_id])
    @component = @resume.components.find(params[:component_id])
    if @component.update(component1_params)
        # 使用 Turbo Streams 更新 HTML 組件
        # 或者，如果你想用不同的動作（例如 replace），可以使用：
        turbo_stream.replace("resumes_#{params[:resume_id]}_component1s_#{params[:id]}", @component)
    
    # 其他處理...
    else
    # 其他處理...
    end   
  end

  def resume_params
    params.require(:resume).permit(:block, :information, :basic_info, :component_serial)
  end
end
