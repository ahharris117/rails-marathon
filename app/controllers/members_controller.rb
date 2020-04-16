class MembersController < ApplicationController

    def new
        @house = House.find(params[:house_id])
        @member = Member.new
    end

    def create
        @house = House.find(params[:house_id])
        @member = Member.new(member_params)
        @member.house = @house

        if @member.save
            flash[:notice] = 'Member saved successfully.'
            redirect_to @house
        else
            flash.now[:error] = @member.errors.full_messages.to_sentence
            render :new
        end
    end

    private
    def member_params
        params.require(:member).permit(:first_name, :last_name, :house_id)
    end

end