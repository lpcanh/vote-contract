const voteManager = artifacts.require("VoteManager");


contract("voteManager", accounts => {
    it("should put 10000 MetaCoin in the first account", () =>
        voteManager.deployed()
            .then(instance => instance.vote("test1", "test2"))
            .then(index => {
                console.log(index);
            }));
})