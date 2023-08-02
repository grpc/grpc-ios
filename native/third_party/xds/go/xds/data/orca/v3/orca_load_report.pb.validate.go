// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: xds/data/orca/v3/orca_load_report.proto

package v3

import (
	"bytes"
	"errors"
	"fmt"
	"net"
	"net/mail"
	"net/url"
	"regexp"
	"strings"
	"time"
	"unicode/utf8"

	"google.golang.org/protobuf/types/known/anypb"
)

// ensure the imports are used
var (
	_ = bytes.MinRead
	_ = errors.New("")
	_ = fmt.Print
	_ = utf8.UTFMax
	_ = (*regexp.Regexp)(nil)
	_ = (*strings.Reader)(nil)
	_ = net.IPv4len
	_ = time.Duration(0)
	_ = (*url.URL)(nil)
	_ = (*mail.Address)(nil)
	_ = anypb.Any{}
)

// Validate checks the field values on OrcaLoadReport with the rules defined in
// the proto definition for this message. If any rules are violated, an error
// is returned.
func (m *OrcaLoadReport) Validate() error {
	if m == nil {
		return nil
	}

	if m.GetCpuUtilization() < 0 {
		return OrcaLoadReportValidationError{
			field:  "CpuUtilization",
			reason: "value must be greater than or equal to 0",
		}
	}

	if val := m.GetMemUtilization(); val < 0 || val > 1 {
		return OrcaLoadReportValidationError{
			field:  "MemUtilization",
			reason: "value must be inside range [0, 1]",
		}
	}

	// no validation rules for Rps

	// no validation rules for RequestCost

	for key, val := range m.GetUtilization() {
		_ = val

		// no validation rules for Utilization[key]

		if val := val; val < 0 || val > 1 {
			return OrcaLoadReportValidationError{
				field:  fmt.Sprintf("Utilization[%v]", key),
				reason: "value must be inside range [0, 1]",
			}
		}

	}

	if m.GetRpsFractional() < 0 {
		return OrcaLoadReportValidationError{
			field:  "RpsFractional",
			reason: "value must be greater than or equal to 0",
		}
	}

	if m.GetEps() < 0 {
		return OrcaLoadReportValidationError{
			field:  "Eps",
			reason: "value must be greater than or equal to 0",
		}
	}

	// no validation rules for NamedMetrics

	return nil
}

// OrcaLoadReportValidationError is the validation error returned by
// OrcaLoadReport.Validate if the designated constraints aren't met.
type OrcaLoadReportValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e OrcaLoadReportValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e OrcaLoadReportValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e OrcaLoadReportValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e OrcaLoadReportValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e OrcaLoadReportValidationError) ErrorName() string { return "OrcaLoadReportValidationError" }

// Error satisfies the builtin error interface
func (e OrcaLoadReportValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sOrcaLoadReport.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = OrcaLoadReportValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = OrcaLoadReportValidationError{}
