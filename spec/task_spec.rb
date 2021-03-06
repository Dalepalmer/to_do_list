require('spec_helper')

describe(Task) do
  describe("#description") do
    it("lets you give it a descritption") do
      test_task = Task.new({:description => "scrub the zebra", :list_id => 1, :due_date => 19920105})
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 19920105})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#list_id)") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 19920105})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 19920105})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 19920105})
      expect(task1).to(eq(task2))
    end
  end

  
end
