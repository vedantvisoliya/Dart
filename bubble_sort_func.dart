List<int> bubbleSort(List<int> nums){
  for(int i = 0; i < (nums.length-1); i++){
    for(int j = i+1; j < (nums.length); j++){
      if(nums[i] > nums[j]){
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
      }
    }
  }
  return nums;
}

void main(){
  List<int> numbers = [5,6,7,4,3,2,1,8,9];
  print(numbers);
  print(bubbleSort(numbers));;
}