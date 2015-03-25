coreo_aws_vpc_vpc "cy-test-vpc" do
  action :find_or_create
  cidr "10.0.0.0/16"
  internet_gateway true
end

coreo_aws_vpc_routetable "cy-public-route" do
  action :sustain
  vpc "cy-test-vpc"
  routes [
             { :from => "0.0.0.0/0", :to => "cy-test-vpc", :type => :igw },
        ]
end

coreo_aws_vpc_subnet "cy-public-subnet" do
  action :sustain
  number_of_zones 3
  percent_of_vpc_allocated 50
  route_table "cy-public-route"
  vpc "cy-test-vpc"
  map_public_ip_on_launch true
end
