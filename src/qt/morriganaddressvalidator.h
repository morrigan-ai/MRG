// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Morrigan Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef MORRIGAN_QT_MORRIGANADDRESSVALIDATOR_H
#define MORRIGAN_QT_MORRIGANADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class MorriganAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MorriganAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Morrigan address widget validator, checks for a valid morrigan address.
 */
class MorriganAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MorriganAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // MORRIGAN_QT_MORRIGANADDRESSVALIDATOR_H
