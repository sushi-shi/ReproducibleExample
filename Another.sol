contract c {
    int[] testArr;
    function test14() public returns (int) {
        int[] storage ptrArr = testArr;
        (int a, int b) = (ptrArr[0], ptrArr[0]);
        return a;
    }
}
