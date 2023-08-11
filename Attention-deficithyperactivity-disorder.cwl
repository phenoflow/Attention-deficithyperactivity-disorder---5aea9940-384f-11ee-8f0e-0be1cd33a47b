cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  attentiondeficithyperactivity-disorder-adhd---primary:
    run: attentiondeficithyperactivity-disorder-adhd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  attention-deficithyperactivity-disorder-adhd-childhood---primary:
    run: attention-deficithyperactivity-disorder-adhd-childhood---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: attentiondeficithyperactivity-disorder-adhd---primary/output
  attention---primary:
    run: attention---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: attention-deficithyperactivity-disorder-adhd-childhood---primary/output
  attention-deficithyperactivity-disorder-adhd-conduct---primary:
    run: attention-deficithyperactivity-disorder-adhd-conduct---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: attention---primary/output
  other-attention-deficithyperactivity-disorder-adhd---primary:
    run: other-attention-deficithyperactivity-disorder-adhd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: attention-deficithyperactivity-disorder-adhd-conduct---primary/output
  hyperkinetic-attention-deficithyperactivity-disorder-adhd---primary:
    run: hyperkinetic-attention-deficithyperactivity-disorder-adhd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-attention-deficithyperactivity-disorder-adhd---primary/output
  attention-deficithyperactivity-disorder-adhd-perception---primary:
    run: attention-deficithyperactivity-disorder-adhd-perception---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: hyperkinetic-attention-deficithyperactivity-disorder-adhd---primary/output
  attention-deficithyperactivity-disorder-adhd-control---primary:
    run: attention-deficithyperactivity-disorder-adhd-control---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: attention-deficithyperactivity-disorder-adhd-perception---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: attention-deficithyperactivity-disorder-adhd-control---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
