require "spec_helper"

describe "Routes Helper" do
    it  "routes root to posts#index: http://localhost:3000/" do
        get("/").should route_to("posts#index")
    end
end