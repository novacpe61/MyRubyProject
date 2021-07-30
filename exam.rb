
class Distance
    def initialize(filename)
        file = File.open(filename,"r")
        @arr = file.readlines
        file.close
        i = 0
        @ndata = [["",""]]
        until i >= @arr.length do
            begin
                n1 = @arr[i].split
                Float(n1[0])
                Float(n1[1])
                @ndata.push(n1)
            rescue Exception
            end
            i+=1
        end
        @ndata.shift
    end

    #method solution
    def solu(ar1,ar2)
        x1 = Float(ar1[0])
        x2 = Float(ar2[0])
        y1 = Float(ar1[1])
        y2 = Float(ar2[1])
        rs1 = (y2-y1) ** 2
        rs2 = (x2-x1) ** 2
        lastrs = Math.sqrt(rs1 + rs2)
        print String("%.4f" % lastrs).ljust(20)
    end

    #loop cross operator
    def report
        bl = ""
        print bl.ljust(20)
        @ndata.each do |item|
            print String(item).ljust(20)
        end
        puts

        i = 0
        n2 = n = @ndata.length
        until i == n do
            j = 0
            print String(@ndata[i]).ljust(20)
            until j == n2 do
                solu @ndata[i],@ndata[j]
                j +=1
            end
            puts
            i +=1
        end
    end

end

filename = "input.txt"
distance = Distance.new(filename)
distance.report
