contract c {
  function fst(uint32 a, uint32 b) public pure returns (uint32, uint32) {
    return (a, b);
  }

  function failure() public pure returns (uint256, uint32) {
    uint256 b = 0;
    return fst(0, 0);
  }
}
