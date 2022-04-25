class PaymentsController < ApplicationController
    before_action :load_loan

    def index
        render json: @loan.payments.all
    end

    def show
        @payment = @loan.payments.find_by(id: params[:id])
        if @paymet.present?
            render json: @payment
        else
            render json: { error: "No data found"}
        end
    end

    def create
        @payment = @loan.payments.new(payment_params)
        if @payment.save
            render json: @payment
        else
            render json: @payment.errors
        end
    end

    private
        def payment_params
            params.permit(:amount)    
        end

        def load_loan
            @loan = Loan.find_by(id: params[:loan_id])
        end
end
