class Node
  attr_accessor :parent, :leftChild, :rightChild, :benefit, :weight, :index
  def initialize benefit = nil, weight =nil
    @benefit = benefit
    @weight = weight
    @parent = nil
    @leftChild = nil
    @rightChild = nil
    @index = 0
  end
  def getValue
    return (@benefit/@weight)
  end
  def setBenefit ben
    @benefit = ben
  end
  def setWeight w
    @weight = w
  end
  def setParent parent
    @parent = parent
  end
  def setIndex index
    @index = index
  end
  def getIndex
    return @index
  end
  def setLeftChild leftchild
    @leftChild = leftchild
  end
  def setRightChild rightchild
    @rightChild = rightchild
  end
  def getBenefit
    return @benefit
  end
  def getWeight
    return @weight
  end
  def getParent
    return @parent
  end
  def getLeftChild
    return @leftChild
  end
  def getRightChild
    return @rightChild
  end
  def removeParent
    @parent = nil
  end
  def removeLeftChild
    @leftChild = nil
  end
  def removeRightChild
    @rightChild = nil
  end
  def isRoot
    if @parent == nil
      return true
    else
      return false
    end
  end

end