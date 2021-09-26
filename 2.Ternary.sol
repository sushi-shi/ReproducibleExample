contract c {
  function f(uint32 a, uint32 b) public pure returns (uint32, uint32) {
    return (a, b);
  }

  function failure() public pure returns (uint32, uint32) {
    return f(0, 0);
  }
}
