import * as fs from 'fs'
import path from 'path'

import { argvs, mkdir, exchangeArgv, execSync, cp, capitalize, regexAll } from './utils';

import { fileURLToPath } from 'url';
const __dirname = path.dirname(fileURLToPath(import.meta.url));


class pypi {

    exchange:string;
    
    constructor(exchange: string) {
        this.exchange = exchange;
        this.init(exchange);
    }

    init(exchange) {
        const tempDir = __dirname + `/temp_pypi/`;
        mkdir (tempDir);
    }
}

new pypi(exchangeArgv);
