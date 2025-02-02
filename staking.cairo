%lang starknet

@contract
mod Staking {
    struct Stake {
        balances: map<felt252, u256>,
    }

    #[external]
    fn stake(ref self: Stake, amount: u256) {
        self.balances.insert(1, self.balances.get_or(1, 0) + amount);
    }

    #[external]
    fn withdraw(ref self: Stake, amount: u256) {
        assert(self.balances.get_or(1, 0) >= amount, 'Insufficient balance');
        self.balances.insert(1, self.balances.get_or(1, 0) - amount);
    }
}
