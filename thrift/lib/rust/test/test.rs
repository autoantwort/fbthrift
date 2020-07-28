/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

use fbthrift::{serialize, CompactProtocol, Deserialize, Protocol, Serialize};
use indexmap::{IndexMap, IndexSet};
use interface::NonstandardCollectionTypes;
use std::collections::{BTreeMap, BTreeSet, HashMap, HashSet};
use std::fmt::Debug;
use std::io::Cursor;

#[test]
fn test_nonstandard_collection_types() {
    assert_round_trip(NonstandardCollectionTypes {
        defaultset: make_btreeset(),
        btreeset: make_btreeset(),
        hashset: make_hashset(),
        indexset_a: make_indexset(),
        indexset_b: make_indexset(),
        indexset_c: IndexSet::new(),
        defaultmap: make_btreemap(),
        btreemap: make_btreemap(),
        hashmap: make_hashmap(),
        indexmap_a: make_indexmap(),
        indexmap_b: make_indexmap(),
        indexmap_c: IndexMap::new(),
    });
}

fn make_btreeset() -> BTreeSet<String> {
    let mut set = BTreeSet::new();
    set.insert("btreeset".to_owned());
    set
}

fn make_hashset() -> HashSet<String> {
    let mut set = HashSet::new();
    set.insert("hashset".to_owned());
    set
}

fn make_indexset() -> IndexSet<String> {
    let mut set = IndexSet::new();
    set.insert("indexset".to_owned());
    set
}

fn make_btreemap() -> BTreeMap<String, String> {
    let mut map = BTreeMap::new();
    map.insert("btreemap".to_owned(), String::new());
    map
}

fn make_hashmap() -> HashMap<String, String> {
    let mut map = HashMap::new();
    map.insert("hashmap".to_owned(), String::new());
    map
}

fn make_indexmap() -> IndexMap<String, String> {
    let mut map = IndexMap::new();
    map.insert("indexmap".to_owned(), String::new());
    map
}

fn assert_round_trip<T>(value: T)
where
    T: Serialize<<CompactProtocol as Protocol>::Sizer>
        + Serialize<<CompactProtocol as Protocol>::Serializer>
        + Deserialize<<CompactProtocol as Protocol>::Deserializer>
        + PartialEq
        + Debug,
{
    let bytes = serialize!(CompactProtocol, |w| Serialize::write(&value, w));
    let mut deserializer = <CompactProtocol>::deserializer(Cursor::new(bytes));
    let back = Deserialize::read(&mut deserializer).unwrap();
    assert_eq!(value, back);
}