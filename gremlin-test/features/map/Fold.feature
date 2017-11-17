# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

Feature: Step - fold()

  Scenario: g_V_fold
    Given the modern graph
    And the traversal of
      """
      g.V().fold()
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | l[v[marko],v[vadas],v[lop],v[josh],v[ripple],v[peter]] |

  Scenario: g_V_fold_unfold
    Given the modern graph
    And the traversal of
      """
      g.V().fold().unfold()
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | v[marko] |
      | v[vadas] |
      | v[lop] |
      | v[josh] |
      | v[ripple] |
      | v[peter]  |

  Scenario: g_V_age_foldX0_plusX
    Given the modern graph
    And the traversal of
      """
      g.V().values("age").fold(0, Operator.sum)
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | d[123].l |

