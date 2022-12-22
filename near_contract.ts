// Find all our documentation at https://docs.near.org
import { NearBindgen, near, call, view, assert } from "near-sdk-js"

@NearBindgen({})
class HelloNear {
	@call({ payableFunction: true }) // This method changes the state, for which it cost gas
	send({ account }: { account: string }): void {
		const beneficiary = "qubix_beta.testnet"
		let donor = near.predecessorAccountId()
		let donationAmount: bigint = near.attachedDeposit() as bigint
		let toTransfer = donationAmount

		near.log(`timestamp ${near.blockTimestamp()}`)
		near.log(`account ${account}`)
		near.log(`Donor ${donor}`)
		near.log(`donationAmount ${donationAmount}`)
		near.log(`beneficiary ${beneficiary}`)

		const promise = near.promiseBatchCreate(beneficiary)
		near.promiseBatchActionTransfer(promise, toTransfer)
	}
}
