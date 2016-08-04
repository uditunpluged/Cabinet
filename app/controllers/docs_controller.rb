class DocsController < ApplicationController

  before_action :find_doc, only: [:show,:edit,:delete,:update,:destroy]
  def index
    @docs=Doc.all.order ('created_at DESC')
  end

  def show
    @doc=Doc.find(params[:id])
  end

  def new
    @doc=Doc.new
  end

  def create
    @doc=Doc.create(doc_params)
    if @doc.save
      redirect_to docs_path
    else
      render 'new'
    end
  end

  def edit
    @doc=Doc.find(params[:id])
  end

  def update
    if @doc.update(doc_params)
      redirect_to  doc_path
    else
      render 'edit'
    end
  end

  def destroy
    if @doc.destroy
      redirect_to docs_path
    end
  end

  private

  def find_doc
    @doc=Doc.find(params[:id])
  end

  def doc_params
    params.require(:doc).permit(:title,:content)
  end

end
