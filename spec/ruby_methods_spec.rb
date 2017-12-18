require "ruby_methods.rb"

describe Enumerable do
  let(:array) {[1,2,3,4]}
  let(:hash) {{"real_madrid" => 12, "barcelona" => 5}}
  let(:answer) {[]}

  describe "#my_each" do
    context "given array" do
      it "goes through each element perfoming block on it" do
        array.my_each{ |e| answer << e }
        expect(answer).to eq([1,2,3,4])
      end
    end

    context "given hash" do
      it "goes through key and value peforming block" do
        hash.my_each{ |k,v| answer << v; answer << k}
        expect(answer).to eq([12,"real_madrid",5,"barcelona"])
      end
    end

  end

  describe "#my_each_with_index" do
    context "given array" do
      it "goes through array performs block on element and index" do
        array.my_each_with_index{|e,i| answer << e; answer << i}
        expect(answer).to eq([1,0,2,1,3,2,4,3])
      end
    end
  end

  describe "#my_select" do
    context "given array" do
      it "selects elements that agree with block condition" do
        answer = array.my_select{|e| e >= 3}
        expect(answer).to eq([3,4])
      end
      it "returns empty array if elements disagree with block condition" do
        answer = array.my_select{|e| e > 4}
        expect(answer).to eq([])
      end
    end
  end

  describe "#my_all?" do
    it "returns true if all elements agree with block conditions" do
      answer = array.my_all?{|e| e <= 5}
      expect(answer).to be(true)
    end
  end

  describe "#my_any?" do
    it "returns true if any element agrees with block condition" do
      answer = array.my_any?{|e| e == 2}
      expect(answer).to be(true)
    end

    it "returns false if none of the elements agree with block condition" do
      answer = array.my_any?{|e| e == 5}
      expect(answer).to be(false)
    end
  end

  describe "#my_none" do
    it "returns true if none of the elements agree with block condition" do
      answer = array.my_none?{|e| e < 0}
      expect(answer).to be(true)
    end

    it "returns false if any element agrees with block condition" do
      answer = array.my_none?{|e| e > 2}
      expect(answer).to be(false)
    end
  end

  describe "#my_count" do
    it "gives count of how many elements agree with block condition" do
      answer = array.my_count{|e| e > 1}
      expect(answer).to eq(3)
    end
  end

  describe "#my_map" do
    it "returns new array with elements changed by block condition" do
      answer = array.my_map{|e| e ** 2}
      expect(answer).to eq([1,4,9,16])
    end
  end

  describe "#my_inject" do
    it "takes argument and yields to block modifying argument" do
      answer = array.my_inject(0){|result, e| result += e}
      expect(answer).to eq(10)
    end
  end
end
