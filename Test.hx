class Test {

    static function main() {

        var bst: BalancedBST<Null<Int>, String> = new BalancedBST(function(keyA, keyB) {
            if(keyA < keyB) return -1;
            if(keyA > keyB) return 1;
            return 0;
        });

        bst.insert(6, 'six');
        bst.insert(4, 'four');
        bst.insert(2, 'two');
        bst.insert(1, 'one');
        bst.insert(3, 'three');
        bst.insert(5, 'five');

        for(string in bst) {
            trace(string);
        }

    }
}