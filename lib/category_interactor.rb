module CategoryInteractor
    include Interactor
    def call
        context.classes.each_key do |key|
            @category = Category.new(aeroplane_id: @aeroplane.id , name: key , rows: context.classes[key]['rows'] ,
                                     cols: context.classes[key]['cols'])
            @category.save
        end
    end
end
  