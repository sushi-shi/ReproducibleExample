contract Time {
  uint256 private money;

  function getTimestamp() internal view virtual returns (uint256) {
      return block.timestamp;
  }

  constructor() {
    money = getTimestamp();
  }
}
