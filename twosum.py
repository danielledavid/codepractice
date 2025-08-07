class Solution:
    def twoSum(self, nums, target):
        for i in range(len(nums)-1):
            for j in range(i + 1, len(nums)):
                sum = nums[i] + nums[j]
                print(f"{nums[i]} + {nums[j]} {sum}")
                if nums[i] + nums[j] == target:
                    return ([i, j])

test = Solution()
test.twoSum([3,2,4], 6)
