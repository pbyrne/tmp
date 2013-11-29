fn is_three(num: int) -> bool {
  num % 3 == 0
}

fn is_five(num: int) -> bool {
  num % 5 == 0
}

fn is_fifteen(num: int) -> bool {
  is_three(num) && is_five(num)
}

fn main() {
  for num in range(1, 101) {
    println(
      if is_fifteen(num) { ~"FizzBuzz" }
      else if is_three(num) { ~"Fizz" }
      else if is_five(num) { ~"Buzz" }
      else { num.to_str() }
    );
  }
}

#[test]
fn test_is_three_without_three() {
  if is_three(1) {
    fail!("One is not three");
  }
}

#[test]
fn test_is_three_with_three() {
  assert!(is_three(3), "Three is three");
}

#[test]
fn test_is_five_without_five() {
  if is_five(1) {
    fail!("One is not five");
  }
}

#[test]
fn test_is_five_with_five() {
  assert!(is_five(5), "Five is five");
}

#[test]
fn test_is_fifteen_without_fifteen() {
  if is_fifteen(1) {
    fail!("One is not fifteen");
  }
}

#[test]
fn test_is_fifteen_with_fifteen() {
  assert!(is_fifteen(15), "Fifteen is fifteen");
}
