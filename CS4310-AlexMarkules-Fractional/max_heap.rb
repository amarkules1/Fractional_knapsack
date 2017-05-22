require_relative 'node'
class MaxHeap
  attr_accessor :size, :root
  def initialize root = nil
    @root = root
    @size = 0
  end
  def getNode index
    node = @root
    while index > 0
      if index%2 == 0
        node = node.getRightChild
        index = (index - 2)/2
      end
      if index%2 == 1
        node = node.getLeftChild
        index = (index-1)/2
      end
    end
    return node
  end
  def addNode benefit, weight
    node = Node.new benefit, weight
    if @size==0
      @root = node
      @root.setIndex 0
    end
    if size > 0
      node.setIndex @size
      if size%2 == 0
        parent = getNode((size-2)/2)
        node.setParent(parent)
        parent.setRightChild node

      end
      if size%2 ==1
        parent = getNode((size-1)/2)
        node.setParent(parent)
        parent.setLeftChild node
      end
      while node.getParent != nil && node.getValue > node.getParent.getValue
        swap node, node.getParent
        node = node.getParent
      end
    end

    @size = @size+1
  end
  def getRoot
    return @root
  end
  def getSize
    return @size
  end
  def swap node1, node2
    benefit = node1.getBenefit
    weight = node1.getWeight
    node1.setBenefit(node2.getBenefit)
    node1.setWeight(node2.getWeight)
    node2.setBenefit(benefit)
    node2.setWeight(weight)
  end
  def removeRoot
    root = @root
    cur = @root

    if(cur.getLeftChild != nil && cur.getRightChild != nil)
      if cur.getLeftChild.getValue >cur.getRightChild.getValue
        cur.setWeight cur.getLeftChild.getWeight
        cur.setBenefit cur.getLeftChild.getBenefit
        shiftUp cur.getLeftChild
        return root
      else
        cur.setWeight cur.getRightChild.getWeight
        cur.setBenefit cur.getRightChild.getBenefit
        shiftUp cur.getRightChild
        return root
      end
    elsif cur.getLeftChild != nil
      cur.setWeight cur.getLeftChild.getWeight
      cur.setBenefit cur.getLeftChild.getBenefit
      shiftUp cur.getLeftChild
      return root
    elsif cur.getRightChild != nil
      cur.setWeight cur.getRightChild.getWeight
      cur.setBenefit cur.getRightChild.getBenefit
      shiftUp cur.getRightChild
      return root
    else
      @root = nil
      return root
    end
  end
  def shiftUp cur
    if(cur.getLeftChild != nil && cur.getRightChild != nil)
      if cur.getLeftChild.getValue >cur.getRightChild.getValue
        cur.setWeight cur.getLeftChild.getWeight
        cur.setBenefit cur.getLeftChild.getBenefit
        shiftUp cur.getLeftChild
        return 0
      else
        cur.setWeight cur.getRightChild.getWeight
        cur.setBenefit cur.getRightChild.getBenefit
        shiftUp cur.getRightChild
        return 0
      end
    elsif cur.getLeftChild != nil
      cur.setWeight cur.getLeftChild.getWeight
      cur.setBenefit cur.getLeftChild.getBenefit
      shiftUp cur.getLeftChild
      return 0
    elsif cur.getRightChild != nil
      cur.setWeight cur.getRightChild.getWeight
      cur.setBenefit cur.getRightChild.getBenefit
      shiftUp cur.getRightChild
      return 0
    else
      parent = cur.getParent
      if parent.getLeftChild == cur
        parent.setLeftChild(nil)
        return root
      else
        parent.setRightChild nil
        return 0
      end
    end
  end
end