interface Id {
  function id() external view returns (Id);
}

contract Foo is Id {
  constructor() {}
  function id() external view returns (Id) { return this; }
}

contract Bar {
  Id private _thing;
  constructor(Id thing_) {
    _thing = thing_;
  }

  function get_id() external view returns (Id) { return _thing.id(); }
  function get_it() external view returns (Id) { return _thing;      }
}
