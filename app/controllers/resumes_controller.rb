class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update, :second]

  def show
    @basic_info = @resume.basic_info
  end

  def edit
  end

  def second
    @component_serial = params[:component_serial]
    @component_integer = params[:component_serial].to_i
    if @resume.update(component_serial: @component_integer)
      flash[:notice] = '更新組件成功'
    else
      flash[:alert] = '更新組件失敗'
    end

    # redirect_to resume_path(@resume) # 渲染 resume/show.html.erb 视图
  end

  def update
    if @resume.update(resume_params)
      redirect_to resume_path
    else
      render :edit
    end
  end

  def generate_pdf
    @resume = Resume.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        html_content = render_to_string(template: 'pdf/_pdf', layout: false, locals: { resume: @resume })
        kit = PDFKit.new(html_content, page_size: 'A4')
  
        puts "PDFKit command: #{kit.command}"

        pdf = kit.to_pdf

        puts "PDF result: #{pdf}"
        puts "PDF errors: #{kit.errors}"

        file = kit.to_file("#{Rails.root}/app/views/pdf_save/pdf_resume.pdf")

        send_file("#{Rails.root}/tmp/generated_pdf.pdf", filename: 'generated_file.pdf', type: 'application/pdf', disposition: 'attachment')
      end
    end
  end
  
  
  

  private

  def find_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:block, :information, :basic_info, :component_serial)
  end

end
