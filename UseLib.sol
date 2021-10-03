library Library {
    uint256 internal constant STATIC = 42;
}

contract B {
  uint256 public constant STATIC = 42;
}


contract C {
  function answer() internal returns (uint256) {
    uint a = Library.STATIC;

    B con = new B();
    // Error: Type function () view external returns (uint256) is not implicitly convertible to expected type uint256.
    // uint b = con.STATIC;

    uint b = con.STATIC();

    return a - b;


  }
}
