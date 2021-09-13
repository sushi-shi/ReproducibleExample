import { establishConnection } from './index';
import {
    Keypair,
    Connection,
    BpfLoader,
    BPF_LOADER_PROGRAM_ID,
    PublicKey,
    LAMPORTS_PER_SOL,
    SystemProgram,
    TransactionInstruction,
    Transaction,
    sendAndConfirmTransaction, SYSVAR_CLOCK_PUBKEY,
} from '@solana/web3.js';

export async function main() {
    let conn = await establishConnection();

    let program_id = await conn.loadProgram("bundle.so");
    console.log("ProgramId: "  + program_id.toString());

    let foo = await conn.getContract(program_id, "Foo.abi");
    let bar = await conn.getContract(program_id, "Bar.abi");

    await foo.call_constructor(conn, 'Foo', []);
    let foo_address = '0x' + foo.contractStorageAccount.publicKey.toBuffer().toString('hex');
    await foo.call_function(conn, 'id', []);

    await bar.call_constructor(conn, 'Bar', [foo_address]);
    await bar.call_function(conn, 'get_it', []);
    await bar.call_function(conn, 'get_id', []); // FAILS!
}

